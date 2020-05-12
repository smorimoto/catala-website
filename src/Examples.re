module FrenchFamilyBenefits = {
  let url = "examples/french-family-benefits";

  let family_benefits: string = [%bs.raw {|require("../assets/allocations_familiales.html")|}];

  [%bs.raw {|require("../assets/catala_code.css")|}];

  [@react.component]
  let make = () => {
    <>
      <Utils.PageTitle title="French family benefits computation" />
      <p className=[%tw "pb-16"]>
        {"The source code for this example is available " |> React.string}
        <Utils.TextLink
          target="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales"
          text="here"
        />
        {". What you can see here is the \"weaved\" output of the source files processed by the Catala compiler.
        Weaving is a concept from "
         |> React.string}
        <Utils.TextLink
          target="https://en.wikipedia.org/wiki/Literate_programming#Workflow"
          text="literate programming"
        />
        {", corresponding to the action of interleaving together the code and its textual documentation
         as to produce a reviewable and comprehensive document. Please refer to the "
         |> React.string}
        <Utils.InternalLink target=Guide.url text="reading guide" />
        {" for a hands-on introduction on how to read this document." |> React.string}
      </p>
      <div className="catala-code" dangerouslySetInnerHTML={"__html": family_benefits} />
    </>;
  };
};

let url = "examples";

let family_benefits: string = [%bs.raw {|require("../assets/allocations_familiales.html")|}];

let family_benefits_card: Utils.presentation_card = {
  title: "French family benefits",
  action: Some((FrenchFamilyBenefits.url, "see example")),
  icon: None,
  quote: None,
  content: {
    <p>
      {React.string("The content below is generated by the Catala compiler from the ")}
      <a href="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
        {React.string("source code files of the example")}
      </a>
      {React.string(". The code, like the legislative text it follows, is written in French.")}
    </p>;
  },
};

[@react.component]
let make = () => {
  <>
    <Utils.PageTitle title="Catala examples" />
    <Utils.PresentationCards cards=[|family_benefits_card|] />
  </>;
};
