trigger GradePluginTrigger on Grade_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradePluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradePluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradePluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradePluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradePluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradePluginHandler.handleAfterDelete(Trigger.old);
    }
}
