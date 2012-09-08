//
// Flambe - Rapid game development
// https://github.com/aduros/flambe/blob/master/LICENSE.txt

package flambe.util;

using flambe.util.Strings;

/**
 * Simple runtime assertions. A failed assertion throws an error, which should NOT be caught and
 * handled. Assertions are stripped from release builds, unless the -D flambe_keep_asserts compiler
 * flag is used.
 */
class Assert
{
#if (debug || flambe_keep_asserts)
    /**
     * Asserts that a condition is true.
     * @param message If this assertion fails, the message to include in the thrown error.
     * @param params Optional parameters to be included with the message, see Strings.addParams.
     */
    public static function that (condition :Bool, ?message :String, ?params :Array<Dynamic>)
    {
        if (!condition) {
            fail(message, params);
        }
    }

    /**
     * Immediately fails an assertion. Same as Assert.that(false).
     * @param message The message to include in the thrown error.
     * @param params Optional parameters to be included with the message, see Strings.addParams.
     */
    public static function fail (?message :String, ?params :Array<Dynamic>)
    {
        var error = "Assertion failed!";
        if (message != null) {
            error += " " + message;
        }
        if (params != null) {
            error = error.addParams(params);
        }
        throw error;
    }

#else
    // In release builds, assertions are stripped out
    inline public static function that (condition :Bool, ?message :String, ?params :Array<Dynamic>) {}
    inline public static function fail (?message :String, ?params :Array<Dynamic>) {}
#end
}
