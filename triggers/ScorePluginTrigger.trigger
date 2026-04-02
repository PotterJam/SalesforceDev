trigger ScorePluginTrigger on Score_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScorePluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScorePluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScorePluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScorePluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScorePluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScorePluginHandler.handleAfterDelete(Trigger.old);
    }
}
