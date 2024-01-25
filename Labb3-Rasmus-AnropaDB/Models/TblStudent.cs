using System;
using System.Collections.Generic;

namespace Labb3_Rasmus_AnropaDB.Models;

public partial class TblStudent
{
    public int StudentId { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public string? Personnr { get; set; }

    public string? Klass { get; set; }
}
