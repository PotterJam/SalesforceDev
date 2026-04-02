trigger ReportCatalogTrigger on Report_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
