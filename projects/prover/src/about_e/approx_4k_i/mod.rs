use std::fmt::{Display, Formatter, Write};
use std::fs::write;
use std::path::Path;
use itertools::Itertools;
use latexify::Latexify;
use ordered_float::OrderedFloat;
use serde::{Deserialize};


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

impl Latexify for Approx4K {
    type Context = ();
    // \sum_{k=0}^∞\frac{1}{(4k+1)}=π+\frac{a}{b}
    fn fmt<W: Write>(&self, _: &Self::Context, f: &mut W) -> std::fmt::Result {
        f.write_str(r#"\begin{aligned}
&\sum_{k=0}^∞\frac{"#)?;
        write!(f, "{}}}{{", self.magnification)?;
        for c in self.coefficients.iter() {
            write!(f, "(4k+{c})")?
        }
        f.write_str("}=")?;
        if self.numerator < 0 {
            write!(f, "π-\\frac{{{}}}{{{}}}", self.numerator.abs(), self.denominator)?
        } else {
            write!(f, "\\frac{{{}}}{{{}}}-π", self.numerator.abs(), self.denominator)?
        }
        write!(f, "\\\\\n&Δ={}", self.delta)?;
        f.write_str(r#"\\
\end{aligned}"#)?;
        Ok(())
    }
}

impl Approx4KData {
    pub fn load_json(json: &str) -> Result<Self, anyhow::Error> {
        let data: Vec<Approx4K> = serde_json::from_str(json)?;
        Ok(Self { data })
    }
}

impl Display for Approx4KData {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        for i in self.data.iter().sorted_by_key(|f| OrderedFloat(-f.delta)) {
            f.write_str("$$\n")?;
            Latexify::fmt(i, &mut (), f)?;
            f.write_str("\n$$\n\n")?;
        }
        Ok(())
    }
}

#[test]
fn update() {
    let here = Path::new(env!("CARGO_MANIFEST_DIR")).join("src/about_e/approx_4k_i/readme.md");
    let data = Approx4KData::load_json(include_str!("4k+1.json")).unwrap();
    write(here, data.to_string()).unwrap();
}
