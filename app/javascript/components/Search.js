import React from "react"
class Search extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      keyword: '',
      events: []
    };
  }

  search(e) {
    const inputValue = e.target.value;
    this.setState({
      keyword: inputValue
    })
    fetch('/events/search.json?keyword=' + inputValue)
      .then(res => res.json())
      .then(
        (result) => {
          this.setState({
            events: result.events
          });
        },
        (error) => {
          this.setState({
            error
          });
        }
      )
  }

  render () {
    const { error, keyword, events } = this.state
    if (error) {
      return (
        <div>Error: {error.message}</div>
      );
    } else if (!keyword) {
      return (
        <div className="form-inline my-2 my-sm-0 position-relative">
          <input className="form-control rounded-pill" type="search" placeholder="イベント検索" aria-label="Search"
            value={keyword}
            onChange={(e) => {this.search(e)}}
          />
        </div>
      );
    } else if (events.length == 0) {
      return (
        <div className="form-inline my-2 my-sm-0 position-relative">
          <input className="form-control rounded-pill" type="search" placeholder="イベント検索" aria-label="Search"
            value={keyword}
            onChange={(e) => {this.search(e)}}
          />
          <div id="serch-results" className="card position-absolute w-100">
            <ul className="list-group list-group-flush">
              <li className="list-group-item list-group-item-action">お探しのイベントは存在しません</li>
            </ul>
          </div>
        </div>
      );
    } else {
      return (
        <div className="form-inline my-2 my-sm-0 position-relative">
          <input className="form-control rounded-pill" type="search" placeholder="イベント検索" aria-label="Search"
            value={keyword}
            onChange={(e) => {this.search(e)}}
          />
          <div id="serch-results" className="card position-absolute w-100">
            <div className="list-group list-group-flush">
              { events.map((event) => {
                return (
                  <a href={event.url} className="list-group-item list-group-item-action">{event.title}</a>
                )
              }) }
            </div>
          </div>
        </div>
      );
    }
  }
}

export default Search
