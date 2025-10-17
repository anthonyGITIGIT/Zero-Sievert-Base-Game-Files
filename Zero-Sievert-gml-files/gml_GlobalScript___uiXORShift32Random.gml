function __uiXORShift32Random(arg0)
{
    return (arg0 * abs(__uiXORShift32())) / 9223372036854776000;
}
