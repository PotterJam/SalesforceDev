trigger TargetFilterTrigger on Target_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetFilterHandler.handleAfterDelete(Trigger.old);
    }
}
