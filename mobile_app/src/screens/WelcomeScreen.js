import {Text, TouchableOpacity, View} from "react-native"
import React from "react"
import {styles} from "../styles"

export default function WelcomeScreen(props) {
    const {navigation} = props
    return (
        <View style={styles.container}>
            <Text style={styles.headerText}>Welcome to private could gateway</Text>
            <Text style={styles.contentText}> send an image for text recognition</Text>
            <TouchableOpacity style={styles.button} onPress={() => navigation.navigate('Connect')}>
                <Text style={styles.buttonText}>Connect</Text>
            </TouchableOpacity>
        </View>
    )
}