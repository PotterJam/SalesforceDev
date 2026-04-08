trigger FloorPlanTrigger on Floor_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorPlanHandler.handleAfterDelete(Trigger.old);
    }
}
