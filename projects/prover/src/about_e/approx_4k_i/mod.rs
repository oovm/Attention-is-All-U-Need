use std::fmt::Formatter;
use num::{BigInt, BigRational, BigUint};
use serde::{Deserialize, Deserializer, Serialize};
use serde::de::{MapAccess, Visitor};

mod der;

#[derive(Clone, Debug)]
pub struct Approx4K {
    coefficients: Vec<u32>,
    magnification: BigUint,
    result: BigRational,
    delta: f64,
}

#[test]
fn test() {
    let data: Vec<Approx4K> = serde_json::from_str(include_str!("4k+1.json")).unwrap();
    println!("{:?}", data)
}

impl<'de> Deserialize<'de> for Approx4K {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error> where D: Deserializer<'de> {
        todo!()
    }
}

struct Approx4KVisitor {
    coefficients: Vec<u32>,
    magnification: BigUint,
    numerator: BigInt,
    denominator: BigUint,
    delta: f64,
}


impl<'de> Visitor<'de> for Approx4K {
    type Value = anyhow::Error;

    fn expecting(&self, formatter: &mut Formatter) -> std::fmt::Result {
        todo!()
    }
    fn visit_map<A>(self, map: A) -> Result<Self::Value, A::Error> where A: MapAccess<'de> {
        todo!()
    }
}
