trigger CoverageAdapterTrigger on Coverage_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
