open PageComponents

let pageTitle =
  <Lang.String
    english="French family benefits computation" french={`Calcul des allocations familiales`}
  />

let catalaCodeHTML = %raw(`require("../../assets/allocations_familiales.html")`)

module FormInfos = {
  let englishSchema = %raw(`require("../../assets/allocations_familiales_schema_en.json")`)
  let frenchSchema = %raw(`require("../../assets/allocations_familiales_schema_fr.json")`)

  let englishUiSchema = %raw(`require("../../assets/allocations_familiales_ui_schema_en.json")`)
  let frenchUiSchema = %raw(`require("../../assets/allocations_familiales_ui_schema_fr.json")`)

  let initFormData = None

  let resultLabel =
    <Lang.String
      english="Family benefits monthly amount:"
      french={`Montant mensuel des allocations familiales :`}
    />

  let computeAndPrintResult = (input: Js.Json.t): React.element => <>
    <span className=%twc("text-mb font-mono")>
      {input->FrenchLaw.computeAllocationsFamiliales->React.float}
    </span>
    {React.string(` €`)}
  </>
}

let card: Card.Presentation.t = {
  title: <Lang.String english="French family benefits" french="Allocations familiales" />,
  action: Some((
    Internal([Nav.home, Nav.examples, Nav.frenchFamilyBenefitsExample]),
    <Lang.String english="See example" french={`Voir l'exemple`} />,
  )),
  icon: None,
  quote: None,
  content: <>
    <Lang.String
      english="The content of the example is generated by the Catala compiler from the "
      french={`Le contenu de cet exemple est généré par le compilateur Catala à partir des `}
    />
    <Link.Text
      target="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
      <Lang.String english="source code files of the example" french={`sources de l'exemple`} />
    </Link.Text>
    <Lang.String
      english=". The code, like the legislative text it follows, is written in French." french="."
    />
  </>,
}

module Form = Form.Make(FormInfos)

module Visualizer = Visualizer.Make({
  let pageTitle = pageTitle
  let catalaCodeHTML = catalaCodeHTML
  let resetLog = FrenchLaw.resetLog

  include Form
})

@react.component
let make = () => {
  <>
    <Title> pageTitle </Title>
    <p>
      <Lang.String
        english="The source code for this example is available "
        french={`Le code source de cet exemple est disponible `}
      />
      <Link.Text
        target="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
        <Lang.String english="here" french={`ici`} />
      </Link.Text>
      <Lang.String
        english=". What you can see here is the \"weaved\" output of the source files processed by the Catala compiler.
        Weaving is a concept from "
        french={`. Ce que vous pouvez voir en dessous est la version "tissée" des fichiers sources transformés par le compilateur Catala.
        Le tissage est un concept issu de la `}
      />
      <Link.Text target="https://en.wikipedia.org/wiki/Literate_programming#Workflow">
        <Lang.String english="literate programming" french={`programmation littéraire`} />
      </Link.Text>
      <Lang.String
        english=" corresponding to the action of interleaving together the code and its textual documentation
         as to produce a reviewable and comprehensive document. Please refer to the tutorial for a hands-on introduction
          on how to read this document."
        french={` , qui correspond à l'action d'entremêler le code et sa documentation textuelle dans un document
         complet et lisible. Veuillez vous réferer au tutoriel pour savoir comment lire ce document.`}
      />
    </p>
    <Section title={<Lang.String english="Online computation" french={`Calculateur en ligne`} />}>
      <div className=%twc("inline-flex justify-end")>
        <Button.Internal
          target={[Nav.home, Nav.examples, Nav.frenchFamilyBenefitsExample, Nav.visualization]}>
          <Icon className=%twc("pr-2") name="explore" />
          <Lang.String
            english="Switch to the complete computation with explanations"
            french={`Basculer vers le calculateur complet avec explications`}
          />
        </Button.Internal>
      </div>
      <Form setEventsOpt={_ => ()} collapsible=true />
    </Section>
    <Section title={<Lang.String english="Source code" french={`Code source`} />}>
      <CatalaCode.DangerouslySetInnerHtml html=catalaCodeHTML />
    </Section>
  </>
}
