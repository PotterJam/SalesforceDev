trigger RatioPlanTrigger on Ratio_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioPlanHandler.handleAfterDelete(Trigger.old);
    }
}
