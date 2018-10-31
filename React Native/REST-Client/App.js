import React from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';
/*
class App extends React.Component {
  constructor(props) {
      super(props);
      this.state = {quote: "",movie: ""}
  }
  componentDidMount() {
      fetch('http://172.16.6.9:8081')
          .then((response) => response.json())
          .then((responseJson) => {
              this.setState({quote: responseJson.quote, movie: responseJson.author})
          })
          .catch((error) => {
              console.error(error);
          });
  }
  render() {
      let quote = this.state.quote;
      let movie = this.state.movie;
      return (
          <View>
              <Text style={styles.top}>Quote: {quote}</Text>
              <Text style={styles.bottom}>From the Movie: {movie}</Text>
          </View>
      )
  }
};
*/
class HTTPClient extends React.Component {
    constructor(props) {
        super(props);
        this.state = {data: "", author: "", category: ""};
        this.handleFamous = this.handleFamous.bind(this);
        this.handleMovie = this.handleMovie.bind(this)
    }
    handleFamous() {
        fetch('http://172.16.6.9:8081/famous')
            .then((response) => response.json())
            .then((responseJson) => {
                this.setState({data: responseJson.quote, author: responseJson.author, category: responseJson.category})
            })
            .catch((error) => {
                console.error(error);
            });
    }
    handleMovie() {
        fetch('http://172.16.6.9:8081/movies')
            .then((response) => response.json())
            .then((responseJson) => {
                this.setState({data: responseJson.quote, author: responseJson.author, category: responseJson.category})
            })
            .catch((error) => {
                console.error(error);
            });
    }
    render() {
        let quote = this.state.data;
        let author = this.state.author;
        let category = this.state.category;
        return(
            <View>
                <Button title="Get a quote from a famous Person" onPress={this.handleFamous}/>
                <Button title="Get a quote from a movie" onPress={this.handleMovie}/>
                <Text style={styles.top}>Quote: {quote}</Text>
                <Text style={styles.bottom}>Author/Movie: {author}</Text>
                <Text style={styles.top}>Category: {category}</Text>
            </View>
        )
    }
}
export default class Index extends React.Component {
    render() {
        return <HTTPClient/>
    }
}
const styles = StyleSheet.create({
    topbutton: {marginTop: 50},
    top: {
        marginTop: 100,
        fontSize: 18
    },
    bottom: {
        fontSize: 18
    }
});