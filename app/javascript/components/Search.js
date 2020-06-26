import React from "react"
import PropTypes from "prop-types"
class Search extends React.Component {
  render () {
    return (
      <form className="form-inline my-2 my-lg-0 position-relative">
        <input className="form-control rounded-pill" type="search" placeholder="イベント検索" aria-label="Search" />
        <div id="serch-results" className="card position-absolute w-100">
          <ul className="list-group list-group-flush">
            <li className="list-group-item">Event 01</li>
            <li className="list-group-item">Event 02</li>
            <li className="list-group-item">Event 03</li>
          </ul>
        </div>
      </form>
    );
  }
}

export default Search
