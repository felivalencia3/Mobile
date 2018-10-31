import React, { Component } from 'react';
import { StyleSheet, Text, View, TextInput } from 'react-native';
class Reverse extends Component {
    constructor(props) {
        super(props);
        this.state = {text: ""};
    }
    render() {
        return(
            <View style={{padding: 10, marginTop: 20}}>
                <TextInput placeholder="Enter something here for it to be reversed" style={{height: 40}} onChangeText={(text) => this.setState({text})}/>
                <Text style={{fontSize: 42}}>
                    {this.state.text.split("").reverse().join(" ")}
                </Text>
            </View>
        )
    }
}

export default class App extends React.Component {
  render() {
    return (
      <View>
          <Reverse/>
      </View>
    );
  }
}
