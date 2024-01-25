using System;
using System.Collections.Generic;

namespace Labb3_Rasmus_AnropaDB.Models;

public partial class TblPersonal
{
    public int PersonalId { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public string? Befattning { get; set; }
}
