import {Text, View} from "react-native"
import React from "react"
import {styles} from "../styles"
import SshClient from "../components/SshClient"

export default function ConnectScreen(props) {
    const sshClient = new SshClient()

    sshClient.connect()

    return (
        <View style={styles.container}>
            <Text style={styles.headerText}>Connecting</Text>
        </View>
    )
}