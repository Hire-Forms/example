import React from "react";
import Code from "./code";
import insertCss from "insert-css";

let fs = require("fs");
let css = fs.readFileSync(__dirname + "/index.css");

if (typeof window !== "undefined" && window.document) {
	insertCss(css, {prepend: true});
}

class Example extends React.Component {
	render() {
		return (
			<div className="example">
				<header>
					<h2>{this.props.title}</h2>
				</header>
				<div className="component">
					{this.props.children}
				</div>
				<Code>
					{this.props.children}
				</Code>
			</div>
		);
	}
}

Example.propTypes = {};

Example.defaultProps = {};

export default Example;