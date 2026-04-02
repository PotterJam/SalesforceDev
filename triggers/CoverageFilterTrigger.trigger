trigger CoverageFilterTrigger on Coverage_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageFilterHandler.handleAfterDelete(Trigger.old);
    }
}
