trigger TargetViewTrigger on Target_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetViewHandler.handleAfterDelete(Trigger.old);
    }
}
