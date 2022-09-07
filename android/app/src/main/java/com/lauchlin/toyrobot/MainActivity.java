package com.lauchlin.toyrobot;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;

import java.util.Arrays;
import java.util.List;


public class MainActivity extends ActionBarActivity {

    private Robot robot;
    private Table table;
    private EditText reportText;
    public static List<String> directions = Arrays.asList("NORTH", "EAST", "SOUTH", "WEST");

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //table = new Table(new Point(0,0), new Point(4,4));
        //robot = new Robot(new Point(0,0), 0.0, null);
        //reportText = (EditText) findViewById(R.id.reportEditText);

        //Spinner directionList = (Spinner) findViewById(R.id.directionsSpinner);
        //ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, directions);
        //directionList.setAdapter(adapter);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    public void onPlace(View view) {
        //String x = ((EditText) findViewById(R.id.xEditText)).getText().toString();
        //String y = ((EditText) findViewById(R.id.yEditText)).getText().toString();
        //String direction = ((Spinner) findViewById(R.id.directionsSpinner)).getSelectedItem().toString();
        //double facing = directions.indexOf(direction)/2.0;
        //robot.place(new Point(Float.parseFloat(x), Float.parseFloat(y)), facing, table);
        //reportText.setText("Place");
    }

    public void onMove(View view) {
        //robot.move();
        //reportText.setText("Move");
    }

    public void onLeft(View view) {
        //robot.left();
        //reportText.setText("Left");
    }

    public void onRight(View view) {
        //robot.right();
        //reportText.setText("Right");
    }

    public void onReport(View view) {
        //reportText.setText(robot.report(directions));
    }
}
