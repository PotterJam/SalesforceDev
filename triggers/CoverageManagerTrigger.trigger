trigger CoverageManagerTrigger on Coverage_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageManagerHandler.handleAfterDelete(Trigger.old);
    }
}
