// use num::bigint::ParseBigIntError;
// use super::*;
//
//
// impl<'de> Deserialize<'de> for Approx4K {
//     fn deserialize<D>(deserializer: D) -> Result<Self, D::Error> where D: Deserializer<'de> {
//         let mut v = Approx4KVisitor::default();
//         deserializer.deserialize_map(&mut v)?;
//         Ok(v.finish())
//     }
// }
//
// #[derive(Default)]
// struct Approx4KVisitor {
//     coefficients: Vec<u32>,
//     magnification: BigUint,
//     numerator: BigInt,
//     denominator: BigInt,
//     delta: f64,
// }
//
// impl Approx4KVisitor {
//     fn finish(self) -> Approx4K {
//         Approx4K {
//             coefficients: self.coefficients,
//             magnification: self.magnification,
//             result: BigRational::new(self.numerator, self.denominator),
//             delta: self.delta,
//         }
//     }
// }
//
//
// impl<'i, 'de> Visitor<'de> for &'i mut Approx4KVisitor {
//     type Value = ();
//
//     fn expecting(&self, formatter: &mut Formatter) -> std::fmt::Result {
//         formatter.write_str("struct Approx4K")
//     }
//     fn visit_map<A>(mut self, mut map: A) -> Result<Self::Value, A::Error> where A: MapAccess<'de> {
//         while let Some(key) = map.next_key::<String>()? {
//             match key.as_str() {
//                 "coefficients" => {
//                     self.coefficients = map.next_value()?;
//                 }
//                 "magnification" => {
//                     self.magnification = map.next_value()?;
//                 }
//                 "numerator" => {
//                     // match BigInt::from_str_radix(&map.next_value::<String>()?, 16) {
//                     //     Ok(o) => {
//                     //         self.numerator = o;
//                     //     }
//                     //     Err(e) => {
//                     //         return Err(serde::de::Error::custom(e.to_string()));
//                     //     }
//                     // }
//                     self.numerator = map.next_value()?;
//                 }
//                 "denominator" => {
//                     self.denominator = map.next_value()?;
//                 }
//                 "delta" => {
//                     self.delta = map.next_value()?;
//                 }
//                 _ => {
//                     return Err(serde::de::Error::unknown_field(key.as_str(), &[]));
//                 }
//             }
//         }
//         Ok(())
//     }
// }
