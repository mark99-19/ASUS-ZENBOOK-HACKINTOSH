// Automatic injection of XHC properties

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "HIEP", "XHC", 0)
{
#endif
    // inject properties for XHCI
    External(_SB.PCI0.XHC, DeviceObj)
    Method(_SB.PCI0.XHC._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Local0 = Package()
        {
            "subsystem-id", Buffer() { 0x70, 0x72, 0x00, 0x00 },
            "subsystem-vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
            "AAPL,current-available", Buffer() { 0x34, 0x08, 0, 0 },
            "AAPL,current-extra", Buffer() { 0x98, 0x08, 0, 0, },
            "AAPL,current-extra-in-sleep", Buffer() { 0x40, 0x06, 0, 0, },
            "AAPL,max-port-current-in-sleep", Buffer() { 0x34, 0x08, 0, 0 },
        }
        Return(Local0)
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
