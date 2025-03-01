type affiliation = {
  name: string,
  url: string,
}

type person = {
  name: string,
  website: option<string>,
  affiliation: affiliation,
}

let denisMerigoux = {
  name: "Denis Merigoux",
  website: Some("https://merigoux.fr"),
  affiliation: {
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
}

let marieAlauzen = {
  name: "Marie Alauzen",
  website: Some("https://cv.archives-ouvertes.fr/marie-alauzen"),
  affiliation: {
    name: "Laboratoire Interdisciplinaire Sciences Innovations Sociétés (LISIS)",
    url: "http://umr-lisis.fr/",
  },
}

let lilyaSlimani = {
  name: "Lilya Slimani",
  website: Some("https://www.linkedin.com/in/wouroud-slimani-003621183/"),
  affiliation: {
    name: "EFB",
    url: "http://www.efb.fr/EC_presentation.html",
  },
}

let nicolasChataing = {
  name: "Nicolas Chataing",
  website: Some("https://github.com/skodt"),
  affiliation: {
    name: "ENS Paris",
    url: "https://www.ens.psl.eu/departement/departement-d-informatique",
  },
}

let alainDelaet = {
  name: `Alain Delaët-Tixeuil`,
  website: None,
  affiliation: {
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
}

let aymericFromherz = {
  name: `Aymeric Fromherz`,
  website: Some("https://users.ece.cmu.edu/~afromher/"),
  affiliation: {
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
}

let raphaelMonat = {
  name: `Raphaël Monat`,
  website: Some("https://rmonat.fr/"),
  affiliation: {
    name: "Inria Lille - SyCoMoRES",
    url: "https://team.inria.fr/sycomores/",
  },
}

let sarahLawsky = {
  name: "Sarah Lawsky",
  website: Some("http://www.law.northwestern.edu/faculty/profiles/SarahLawsky/"),
  affiliation: {
    name: "Northwestern Pritzker School of Law",
    url: "http://www.law.northwestern.edu/",
  },
}

let jonathanProtzenko = {
  name: "Jonathan Protzenko",
  website: Some("https://jonathan.protzenko.fr"),
  affiliation: {
    name: "Microsoft Research RiSE",
    url: "https://www.microsoft.com/en-us/research/group/research-software-engineering-rise/",
  },
}

let lianeHuttner = {
  name: "Liane Huttner",
  website: Some("https://www.eui.eu/people?id=liane-huttner"),
  affiliation: {
    name: `European Union Institute`,
    url: "https://www.eui.eu",
  },
}

let christopheGaie = {
  name: "Christophe Gaie",
  website: Some("https://gaie.webnode.page/"),
  affiliation: {
    name: `DINUM`,
    url: "https://www.numerique.gouv.fr/dinum/",
  },
}

let louisGesbert = {
  name: "Louis Gesbert",
  website: Some("https://github.com/AltGr"),
  affiliation: {
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
}

let emileRolley = {
  name: `Émile Rolley`,
  website: Some("https://www.linkedin.com/in/emile-rolley-703b82206/"),
  affiliation: {
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
}

let justineBanuls = {
  name: `Justine Banuls`,
  website: Some("https://www.linkedin.com/in/justine-banuls-getintouch/"),
  affiliation: {
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
}
