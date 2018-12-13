import React, { Component } from 'react';
import { Image, TouchableOpacity, StyleSheet,Text } from 'react-native';
import * as Expo from "expo"
export default class SoundPlayer extends Component {
    constructor(props) {
        super(props)
        this.state = {soundReady: false}
    }
    componentDidMount() {
        this.setupAudio();
    }
    setupAudio() {
        console.log("Setting up audio");
        this.alarmAudio = new Expo.Audio.Sound();
        this.alarmAudio.loadAsync(require("../assets/sounds/alarm.mp3"));
        this.setState({soundReady: true})
    };
    playAudio() {
        console.log("playAudio ran");
        try {
            console.log("Should be playing audio");
            this.alarmAudio.setPositionAsync(0);
            this.alarmAudio.playAsync();
        } catch(err) {
            console.error(err)
        }
    };
    componentWillUnmount() {
        this.alarmAudio.unloadAsync();
    }
    render() {
        if(this.state.soundReady) {
            console.log("Sound is ready");
            this.playAudio();
        }
        return(
            <Text>Audio Player</Text>
        )
    }
}