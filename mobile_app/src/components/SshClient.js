import {Client} from 'ssh2'
import {readFileSync} from 'fs';
import config from '../../config'

class SshClient {
    connect() {
        const conn = new Client()
        conn.on('ready', () => {
            console.log('Client :: ready')

            conn.shell((err, stream) => {
                if (err) throw err

                stream.on('close', () => {
                    console.log('Stream :: close')
                    conn.end()
                }).on('data', (data) => {
                    console.log('OUTPUT: ' + data);
                })
                stream.end('ls -l\nexit\n');
            })
        }).connect({
            host: config.EC2_IP_ADDRESS,
            port: 22,
            username: 'ec2-user',
            privateKey: readFileSync(config.EC2_KEY_PATH)
        });
    }
}

export default SshClient