using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Kantar_BDD.Support.Selenium;

namespace Kantar_BDD.Pages.Promo
{
    [PageName("Constraints Columns")]
    class ConstraintsColumns
    {
        public static readonly AbstractedBy ConstraintIdColumn = AbstractedBy.VisibleSm1ID("Constraint Id Column", "IDCONSTRAINT");
        public static readonly AbstractedBy MovementsColumn = AbstractedBy.VisibleSm1ID("Movements Column", "MOVEMENTS");
        public static readonly AbstractedBy StartDateColumn = AbstractedBy.VisibleSm1ID("Start Date Column", "DTESTART");
        public static readonly AbstractedBy EndDateColumn = AbstractedBy.VisibleSm1ID("End Date Column", "DTEEND");
        public static readonly AbstractedBy FundValueColumn = AbstractedBy.VisibleSm1ID("Fund Value Column", "FUNDVALUE");
        public static readonly AbstractedBy UncommittedBalanceColumn = AbstractedBy.VisibleSm1ID("Uncommitted Balance Column", "FUNDNOTCOMMITTED");
        public static readonly AbstractedBy RemainingBalanceColumn = AbstractedBy.VisibleSm1ID("Remaining balance Column", "FUNDREMAINDER");
        public static readonly AbstractedBy FundReserveColumn = AbstractedBy.VisibleSm1ID("Fund reserve Column", "FUNDRESERVE");
        public static readonly AbstractedBy UnitMeasureColumn = AbstractedBy.VisibleSm1ID("Unit measure Column", "FUNDUM");
        public static readonly AbstractedBy FamilyColumn = AbstractedBy.VisibleSm1ID("Family Column", "PRODATTR1");

        //629 - KPI
        public static readonly AbstractedBy MaxIncidenceColumn = AbstractedBy.VisibleSm1ID("Max Incidence Column", "MAXINCIDENCE");
        public static readonly AbstractedBy MinIncidenceColumn = AbstractedBy.VisibleSm1ID("Min Incidence Column", "MININCIDENCE");
        public static readonly AbstractedBy PromoAmountlyColumn = AbstractedBy.VisibleSm1ID("Promo Amountly Column", "PROMOAMOUNT");
        public static readonly AbstractedBy MaxActionsColumn = AbstractedBy.VisibleSm1ID("Max Actions Column", "MAXACTIONS");
        public static readonly AbstractedBy MinActionsColumn = AbstractedBy.VisibleSm1ID("Min Actions Column", "MINACTIONS");
        public static readonly AbstractedBy MinRoiColumn = AbstractedBy.VisibleSm1ID("Min Roi Column", "MINROI");
        public static readonly AbstractedBy SellinDaysColumn = AbstractedBy.VisibleSm1ID("Sell-in Days Column", "SELLINDAYS");
        public static readonly AbstractedBy SelloutDaysColumn = AbstractedBy.VisibleSm1ID("Sell-out Days Column", "SELLOUTDAYS");
        public static readonly AbstractedBy ContiguosSellinDaysColumn = AbstractedBy.VisibleSm1ID("Contiguos Sell-in Days Column", "CONTIGUOSSELLINDAYS");
        public static readonly AbstractedBy ProductColumn = AbstractedBy.VisibleSm1ID("Product Column", "PRODATTR2");
    }
}
