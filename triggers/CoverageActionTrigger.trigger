trigger CoverageActionTrigger on Coverage_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageActionHandler.handleAfterDelete(Trigger.old);
    }
}
