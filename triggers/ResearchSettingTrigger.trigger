trigger ResearchSettingTrigger on Research_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchSettingHandler.handleAfterDelete(Trigger.old);
    }
}
