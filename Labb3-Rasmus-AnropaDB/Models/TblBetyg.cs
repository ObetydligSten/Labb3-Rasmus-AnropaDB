using System;
using System.Collections.Generic;

namespace Labb3_Rasmus_AnropaDB.Models;

public partial class TblBetyg
{
    public int? StudentId { get; set; }

    public int? KursId { get; set; }

    public string? Betyg { get; set; }

    public DateOnly? Betygsdatum { get; set; }

    public int? PersonalId { get; set; }

    public virtual TblKur? Kurs { get; set; }

    public virtual TblPersonal? Personal { get; set; }

    public virtual TblStudent? Student { get; set; }
}
