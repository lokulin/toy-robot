package com.lauchlin.toyrobot;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.charset.Charset;
import java.util.stream.Stream;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedReader;

public class App
{
    private static Table table = new Table(new Point(0,0), new Point(4,4));
    private Robot robot;

    private static Pattern p = Pattern.compile(
              "^"                                          // start of line
              + "(?<cmd>MOVE$|LEFT$|RIGHT$|REPORT$|PLACE)" // the command
              + "(?>\\s?"                                  // single space
                + "(?<x>\\d+),"                            // x coord
                + "(?<y>\\d+),"                            // y coord
                + "(?<dir>NORTH|EAST|SOUTH|WEST)"          // direction
              + "$)?");                                     // end of line

    private static List<String> directions = Arrays.asList("NORTH", "EAST",
                                                            "SOUTH", "WEST");

    public App() {
        this.robot = new Robot(new Point(0,0), 0.0, null);
    }

    public void run(String line) {
      Matcher m = p.matcher(line);
      if (m.matches()) {
        switch (m.group("cmd")) {
          case "MOVE": robot.move();
            break;
          case "LEFT": robot.left();
            break;
          case "RIGHT": robot.right();
            break;
          case "REPORT": robot.report(directions);
            break;
          case "PLACE":
            if ( m.group("x") != null
                && m.group("y") != null
                && m.group("dir") != null) {
              robot.place(new Point(Float.parseFloat(m.group("x"))
                                   ,Float.parseFloat(m.group("y")))
                          , directions.indexOf(m.group("dir"))/2.0
                          , table);
            }
            break;
          default:
            break;
        }
      }
    }

    public static void main( String[] args )
    {
      App app = new App();

      try {
        Stream<String> stream;

        if (args.length == 0) {
          stream = (new BufferedReader(new InputStreamReader(System.in))).lines();
        } else {
          stream = Files.lines(Paths.get(args[0]), Charset.defaultCharset());
        }

        stream.forEach((line) -> app.run(line));

      } catch (IOException | SecurityException ex) {
        System.out.println("Could not read input.");
      }
    }
}
