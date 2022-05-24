module NavElem = {
  @react.component
  let make = (~elements: array<Nav.navElem>) => {
    let (lang, _) = React.useContext(Lang.langContext)
    <a
      className=%tw("cursor-pointer text-white uppercase p-1 hover:text-primary")
      onClick={_ => Nav.goTo(elements, lang)}>
      {Belt.Array.getExn(elements, Belt.Array.length(elements) - 1).text}
    </a>
  }
}

module NavBar = {
  @react.component
  let make = (~elements: array<Nav.navElem>) =>
    <div
      className=%tw(
        "w-full py-1 px-2 mx-2 inline-flex flex-row flex-wrap content-center bg-tertiary rounded"
      )>
      {elements->Belt.Array.reduceWithIndex(<div />, (acc, _, i) => <>
        acc
        <div key={string_of_int(i)}>
          {if i != 0 {
            <i className="float-left py-0.5 text-primary material-icons">
              {React.string("chevron_right")}
            </i>
          } else {
            <i />
          }}
          <NavElem elements={elements->Belt.Array.slice(~offset=0, ~len=i + 1)} />
        </div>
      </>)}
    </div>
}

module SwitchLang = {
  @react.component
  let make = _ => {
    let (old_lang, setLang) = React.useContext(Lang.langContext)
    let url = ReasonReactRouter.useUrl()
    <a
      className=%tw(
        "px-2 cursor-pointer text-white uppercase hover:text-primary bg-tertiary rounded"
      )
      onClick={_ => {
        let (_, navs) = Nav.urlToNavElem(url)
        setLang()
        let new_lang = Lang.new_lang_from_old_lang(old_lang)
        Nav.goTo(navs, new_lang)
      }}>
      <Lang.String french="En" english=`Fr` />
    </a>
  }
}

type imgLocation = {default: string}

let logo: imgLocation = %raw("require('../../assets/logo.png')")

@react.component
let make = () => {
  let url = ReasonReactRouter.useUrl()
  <div className=%tw("flex flex-row w-full justify-between bg-secondary top-0")>
    <div
      className=%tw(
        "py-2 h-full flex flex-row items-center justify-center md:justify-start pl-4 text-3xl md:text-2xl lg:text-xl text-white"
      )>
      <Link.Internal target=[Nav.home]>
        <div className=%tw("flex flex-row flex-nowrap items-center hover:text-primary")>
          <img className=%tw("h-8 pr-4") src={"/" ++ logo.default} />
          <Lang.String english="The Catala Language" french=`Le langage Catala` />
        </div>
      </Link.Internal>
    </div>
    <div className=%tw("flex flex-row justify-center items-center")>
      <div className=%tw("inline-flex justify-start bg-secondary text-xl pr-4")>
        <SwitchLang />
      </div>
      <div
        className=%tw(
          "inline-flex flex-row flex-wrap h-full items-center justify-end md:justify-end md:pt-0 "
        )>
        {
          let (_, elements) = url->Nav.urlToNavElem
          <NavBar elements />
        }
      </div>
    </div>
  </div>
}
