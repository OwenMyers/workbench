
import execnet

def main():

    gw = execnet.makegateway("popen//python=/usr/local/bin/jython")

    channel = gw.remote_exec(
        """
        import try_write_xml as twx
        twx.write()
        """
    )

if __name__ == '__main__':
    main()


