use std::fmt::{Formatter, Write};
use latexify::Latexify;
use num::{BigInt, BigRational, BigUint, Num};
use serde::{Deserialize, Deserializer, Serialize};
use serde::de::{MapAccess, Visitor};

mod der;

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
        f.write_str(r#"\sum_{k=0}^∞\frac{"#)?;
        f.write_str(self.magnification.to_string().as_str())?;
        f.write_str("}{")?;
        for c in self.coefficients.iter() {
            write!(f, "(4k+{c})")?
        }
        f.write_str("}=")?;
        if self.numerator < 0 {
            write!(f, "π-\\frac{{{}}}{{{}}}", self.numerator.abs(), self.denominator)
        } else {
            write!(f, "\\frac{{{}}}{{{}}}-π", self.numerator.abs(), self.denominator)
        }
    }
}

#[test]
fn test() {
    let data: Vec<Approx4K> = serde_json::from_str(include_str!("4k+1.json")).unwrap();
    for i in data {
        println!("{}", i.to_latex(&mut ()));
    }
}
