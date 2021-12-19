import {Text, View} from "react-native"
import React from "react"
import {styles} from "../styles"

export default function WelcomeScreen(props) {
    const {navigation} = props
    return (
        <View style={styles.container}>
            <Text style={styles.headerText}>Welcome to our Mobile APP!</Text>
            <Text style={styles.contentText}> "Testing "</Text>
            <Text style={styles.authors}>~Lukasz Socha!!!, Michał Szkarłat</Text>
            {/*<TouchableOpacity style={styles.button} onPress={() => navigation.navigate('EyesightTest')}>*/}
            {/*    <Text style={styles.buttonText}>Start test!</Text>*/}
            {/*</TouchableOpacity>*/}
        </View>
    )
}