ENTRY(_start) 

SECTIONS
{
    . = 1M;

    .multiboot : ALIGN(4) { 
        *(.multiboot) 
    }

    .text : { 
        *(.text) 
    }

    .bss : {
        *(.bss)
    }
}
