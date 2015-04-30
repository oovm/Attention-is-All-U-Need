use std::fmt::{Display, Formatter, Write};
use std::fs::write;
use std::path::Path;
use itertools::Itertools;
use latexify::Latexify;
use ordered_float::OrderedFloat;
use serde::{Deserialize};

mod display;

mod der;


pub struct Approx4KData {
    data: Vec<Approx4K>,
}

#[derive(Clone, Debug, Deserialize)]
pub struct Approx4K {
    coefficients: Vec<u8>,
    magnification: u64,
    numerator: i64,
    denominator: i64,
    delta: f64,
}

impl Approx4KData {
    pub fn load_json(json: &str) -> Result<Self, anyhow::Error> {
        let data: Vec<Approx4K> = serde_json::from_str(json)?;
        Ok(Self { data })
    }
}


#[test]
fn update() {
    let here = Path::new(env!("CARGO_MANIFEST_DIR")).join("src/about_e/approx_4k_i/readme.md");
    let data = Approx4KData::load_json(include_str!("4k+1.json")).unwrap();
    write(here, data.to_string()).unwrap();
}
