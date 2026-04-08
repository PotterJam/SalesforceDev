trigger CoverageViewTrigger on Coverage_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageViewHandler.handleAfterDelete(Trigger.old);
    }
}
