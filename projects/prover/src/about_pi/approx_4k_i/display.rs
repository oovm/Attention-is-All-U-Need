use super::*;

impl Display for Approx4K {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        write!(f, "Inactive[Sum][{}/Product[4k+i,", self.magnification)?;
        f.write_str("{i,{")?;
        for (i, c) in self.coefficients.iter().enumerate() {
            if i != 0 {
                f.write_str(",")?;
            }
            write!(f, "{}", c)?;
        }
        f.write_str("}}],{k,0,Infinity}]")
    }
}

impl Latexify for Approx4K {
    type Context = ();
    // \sum_{k=0}^∞\frac{1}{(4k+1)}=π+\frac{a}{b}
    fn fmt<W: Write>(&self, _: &Self::Context, f: &mut W) -> std::fmt::Result {
        f.write_str(
            r#"\begin{aligned}
&\sum_{k=0}^∞\frac{"#,
        )?;
        write!(f, "{}}}{{", self.magnification)?;
        for c in self.coefficients.iter() {
            write!(f, "(4k+{c})")?
        }
        f.write_str("}=")?;
        if self.numerator == 0 {
            f.write_str("π")?
        }
        else if self.numerator < 0 {
            write!(f, "π-\\frac{{{}}}{{{}}}", self.numerator.abs(), self.denominator)?
        }
        else {
            write!(f, "\\frac{{{}}}{{{}}}-π", self.numerator.abs(), self.denominator)?
        }
        write!(f, "\\\\\n&Δ={}", self.delta)?;
        f.write_str(
            r#"\\
\end{aligned}"#,
        )?;
        Ok(())
    }
}

impl Display for Approx4KData {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        for i in self.data.iter().sorted_by_key(|f| OrderedFloat(-f.delta)) {
            f.write_str("```wolfram\n")?;
            Display::fmt(i, f)?;
            f.write_str("\n```\n")?;
            f.write_str("$$\n")?;
            Latexify::fmt(i, &mut (), f)?;
            f.write_str("\n$$\n\n")?;
        }
        Ok(())
    }
}
