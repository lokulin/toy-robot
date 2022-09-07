package com.lauchlin.toyrobot;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class TableTest extends TestCase
{
    Table table = new Table(new Point(0,0), new Point(4,4));

    public TableTest( String testName )
    {
        super( testName );
    }

    public static Test suite()
    {
        return new TestSuite( TableTest.class );
    }

    public void testTable()
    {
        assertTrue( table.contains(new Point(0,0)) );
        assertFalse( table.contains(new Point(6,6)) );
    }
}
