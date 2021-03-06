//
// Flambe - Rapid game development
// https://github.com/aduros/flambe/blob/master/LICENSE.txt

package flambe.platform.html;

import js.Lib;

import flambe.external.External;

class HtmlExternal
    implements External
{
    public var supported (get_supported, null) :Bool;

    public function new ()
    {
    }

    public function get_supported ()
    {
        return true;
    }

    public function call (name :String, ?params :Array<Dynamic>) :Dynamic
    {
        if (params == null) {
            params = [];
        }

        var method = Reflect.field(Lib.window, name);
        return Reflect.callMethod(null, method, params);
    }

    public function bind (name :String, fn :Dynamic)
    {
        Reflect.setField(Lib.window, name, fn);
    }
}
