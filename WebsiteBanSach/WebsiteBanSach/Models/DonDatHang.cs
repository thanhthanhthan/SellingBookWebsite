//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebsiteBanSach.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DonDatHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonDatHang()
        {
            this.Carts = new HashSet<Cart>();
        }
    
        public int DDH_ID { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public Nullable<bool> isDelivered { get; set; }
        public Nullable<System.DateTime> DeliverDate { get; set; }
        public Nullable<bool> isPaid { get; set; }
        public string CusUsername { get; set; }
        public Nullable<bool> isCanceled { get; set; }
        public Nullable<bool> isDeleted { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual Customer Customer { get; set; }
    }
}