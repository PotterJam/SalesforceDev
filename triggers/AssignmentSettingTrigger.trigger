trigger AssignmentSettingTrigger on Assignment_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentSettingHandler.handleAfterDelete(Trigger.old);
    }
}
