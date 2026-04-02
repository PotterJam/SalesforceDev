trigger ComplianceCatalogTrigger on Compliance_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
