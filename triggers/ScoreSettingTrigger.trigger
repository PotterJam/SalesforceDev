trigger ScoreSettingTrigger on Score_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreSettingHandler.handleAfterDelete(Trigger.old);
    }
}
