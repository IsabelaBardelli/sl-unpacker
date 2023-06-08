default
{
    touch_start(integer total_number)
    {
        llMessageLinked(0, LINK_THIS, llGetScriptName(), "");
    }
}
