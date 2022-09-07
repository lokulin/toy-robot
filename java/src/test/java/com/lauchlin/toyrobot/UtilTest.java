package com.lauchlin.toyrobot;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class UtilTest extends TestCase
{
    public UtilTest( String testName )
    {
        super( testName );
    }

    public static Test suite()
    {
        return new TestSuite( UtilTest.class );
    }

    public void testUtil()
    {
        assertEquals(Util.fmod(-0.5, 2.0), 1.5);
        assertEquals(Util.fmod(2.5, 2.0), 0.5);
        assertEquals(Util.fmod(-0.5, -2.0), -0.5);
        assertEquals(Util.fmod(2.5, -2.0), -1.5);
    }
}
