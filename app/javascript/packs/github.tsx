// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import * as React from 'react'
import * as ReactDOM from 'react-dom'

type RequiredProps = {
  name: string,
}

type DefaultProps = {
  name: string,
}

type State = {
}

class Hello extends React.Component<RequiredProps, State> {
  public static defaultProps: DefaultProps = {
    name: 'David'
  }

  render() {
    return (
      <div>Hello {this.props.name}!</div>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Hello name="React" />,
    document.body.appendChild(document.createElement('div')),
  )
})
