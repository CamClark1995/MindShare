import React from "react"
import PropTypes from "prop-types"
class Tweet extends React.Component {
    constructor(props) {
        super(props);
        this.state = {time: posted_at(props.created_at)}
    }

    componentDidMount() {
        this.timerID = setInterval(()=>this.tick(), 60000)
    }

    componentWillUnmount() {
        clearInterval(this.timerID);
    }

    tick() {
        this.setState({time: posted_at(this.props.created_at)})
    }

    render () {
        return (
            <div className={'tweet'}>
                <TweetContent content={this.props.content }/>
                <TweetInfo name={this.props.username} time={this.state.time}/>
            </div>
        );
    }
}

class TweetInfo extends React.Component {
    render () {
        return (
            <div className={'tweet_info'}>
                <div>{this.props.name}</div>
                <div>{this.props.time}</div>
            </div>
        );
    }
}

class TweetContent extends React.Component {
    render () {
        return (
            <div className={'tweet_content'}>
                {this.props.content}
            </div>
        );
    }
}

function posted_at(datetime) {
    let postedTime = new Date(datetime);
    let currentTime = new Date();
    let seconds = Math.round((currentTime.getTime() - postedTime.getTime())/1000);
    let minutes = Math.round(seconds/60);
    let hours = Math.round(minutes/60);
    let days = Math.round(hours / 60);
    if (days > 0) {
        return days===1 ?  days + ' day ago' :  days + ' days ago';
    } else if (hours > 0) {
        return hours===1 ? hours + ' hour ago' : hours + ' hours ago';
    } else if (minutes > 0) {
        return minutes===1 ? minutes + ' minute ago' : minutes + ' minutes ago';
    } else {
        return seconds===1 ? seconds + ' second ago' : seconds + ' seconds ago';
    }
}

// Tweet.propTypes = {
//   content: PropTypes.string,
//   username: PropTypes.string,
//   time: PropTypes.string
// };
export default Tweet
